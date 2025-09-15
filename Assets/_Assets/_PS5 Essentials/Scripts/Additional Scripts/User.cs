


#if UNITY_PS5
using UnityEngine.PS5;
using Unity.PSN.PS5.Aysnc;
using Unity.PSN.PS5.Sessions;
using Unity.PSN.PS5.Trophies;
using Unity.PSN.PS5.Users;
using UnityEngine;
#endif

/*
 * This User class is adapted from the PSN package sample to manage each user active on the PS5.
 * 
 * For the full sample script, download to the PSN package sample project from the Package Manager window.
 */

class User
{
#if UNITY_PS5
    static User()
    {
        PS5Input.OnUserServiceEvent += OnUserServiceEvent;
    }

    public GamePad gamePad;
    public bool IsRegistered { get; set; }
    public bool RegistrationChangePending { get; set; }


    static void OnUserServiceEvent(PS5Input.UserServiceEventType eventtype, uint userid)
    {
        Debug.Log("OnUserServiceEvent -> User state changed : " + eventtype);

        if (eventtype == PS5Input.UserServiceEventType.Login)
        {
            UserLoggedIn((int)userid);
        }
        else if (eventtype == PS5Input.UserServiceEventType.Logout)
        {
            UserLoggedOut((int)userid);
        }
    }

    public static void UserLoggedIn(int userid)
    {
        User user = FindUser((int)userid);

        if (user != null)
        {
            if (user.IsRegistered == true)
            {
                return;
            }

            if (user.RegistrationChangePending == true)
            {
                return;
            }

            user.RegistrationChangePending = true;

            UserSystem.AddUserRequest request = new UserSystem.AddUserRequest() { UserId = (int)userid };

            var requestOp = new AsyncRequest<UserSystem.AddUserRequest>(request).ContinueWith((antecedent) =>
            {
                if (antecedent != null && antecedent.Request != null)
                {
                    User registeredUser = User.FindUser(antecedent.Request.UserId);

                    if (registeredUser != null)
                    {
                        if (NpManager.CheckAsyncRequestOK(antecedent))
                        {
                            Debug.Log("User Initalised");

                            if (registeredUser != null)
                            {
                                registeredUser.IsRegistered = true;
                                Debug.Log("SessionsManager.RegisterUserSessionEvent");
                                SessionsManager.RegisterUserSessionEvent(antecedent.Request.UserId);
                                PS5TrophyManager.Instance.hasSetupUser = true;
                            }

                        }
                        registeredUser.RegistrationChangePending = false;
                    }
                }
            });

            UserSystem.Schedule(requestOp);

            Debug.Log("User being added...");
        }
    }

    public static void UserLoggedOut(int userid)
    {
        User user = FindUser((int)userid);

        if (user != null)
        {
            if (user.IsRegistered == false)
            {
                return;
            }

            if (user.RegistrationChangePending == true)
            {
                return;
            }

            user.RegistrationChangePending = true;

            SessionsManager.UnregisterUserSessionEvent((int)userid);

            UserSystem.RemoveUserRequest request = new UserSystem.RemoveUserRequest() { UserId = userid };

            var requestOp = new AsyncRequest<UserSystem.RemoveUserRequest>(request).ContinueWith((antecedent) =>
            {
                if (antecedent != null && antecedent.Request != null)
                {
                    User registeredUser = User.FindUser(antecedent.Request.UserId);

                    if (registeredUser != null)
                    {
                        if (NpManager.CheckAsyncRequestOK(antecedent))
                        {

                            if (registeredUser != null)
                            {
                                registeredUser.IsRegistered = false;
                            }
                        }
                        registeredUser.RegistrationChangePending = false;
                    }
                }
            });

            UserSystem.Schedule(requestOp);

        }
    }

    public static User GetActiveUser
    {
        get
        {
            if (GamePad.activeGamePad == null) return null;

            return FindUser(GamePad.activeGamePad.m_loggedInUser.userId);
        }
    }

    public static bool IsActiveUserRegistered
    {
        get
        {
            User user = GetActiveUser;

            if (user != null)
            {
                return user.IsRegistered;
            }
            return false;
        }
    }

    public static User[] users = new User[4];

    public static User FindUser(int userId)
    {
        for (int i = 0; i < users.Length; i++)
        {
            if (users[i] != null && users[i].gamePad != null)
            {
                if (users[i].gamePad.m_loggedInUser.userId != 0 && users[i].gamePad.m_loggedInUser.userId == userId)
                {
                    return users[i];
                }
            }
        }

        return null;
    }

    public static void Initialize(GamePad[] gamePads)
    {
        Debug.Log("Initialize users!");

        for (int i = 0; i < gamePads.Length; i++)
        {
            int playerId = gamePads[i].playerId;

            users[playerId] = new User();
            users[playerId].gamePad = gamePads[i];
        }
    }

    public static void CheckRegistration()
    {
        for (int i = 0; i < users.Length; i++)
        {
            if (users[i] != null && users[i].gamePad != null)
            {
                if (users[i].gamePad.IsConnected == true)
                {
                    if (users[i].gamePad.m_loggedInUser.status == 1)
                    {
                        if (users[i].IsRegistered == false)
                        {
                            UserLoggedIn(users[i].gamePad.m_loggedInUser.userId);
                        }
                    }
                }
                else
                {
                    if (users[i].gamePad.m_loggedInUser.status == 0)
                    {
                        if (users[i].IsRegistered == true)
                        {
                            UserLoggedOut(users[i].gamePad.m_loggedInUser.userId);
                        }
                    }
                }
            }
        }
    }


#endif
}

