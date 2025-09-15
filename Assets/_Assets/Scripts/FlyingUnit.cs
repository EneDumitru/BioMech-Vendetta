using DG.Tweening;
using EmeraldAI;
using UnityEngine;
using UnityEngine.AI;
using Random = UnityEngine.Random;

namespace _Assets.Scripts
{
    public class FlyingUnit : MonoBehaviour
    {
        [SerializeField] private GameObject shadowProjector;
        [SerializeField] private Vector2 offSetRandomRange;
        [SerializeField] private float deathFallDuration = 2f;
        private NavMeshAgent _agent;
        private EmeraldAISystem EmeraldComponent;

        private void Awake()
        {
            shadowProjector.SetActive(false);
            _agent = GetComponent<NavMeshAgent>();
            EmeraldComponent = GetComponent<EmeraldAISystem>();
        }

        private void Start()
        {
            _agent.baseOffset = Random.Range(offSetRandomRange.x, offSetRandomRange.y);
        }

        public void Kill()
        {
            DOTween.To(() => _agent.baseOffset, x => _agent.baseOffset = x, 0f, deathFallDuration)
                .SetEase(Ease.OutQuad).OnComplete(() =>
                {
                    if (EmeraldComponent.m_NavMeshAgent.enabled)
                    {
                        EmeraldComponent.m_NavMeshAgent.ResetPath();
                        EmeraldComponent.m_NavMeshAgent.isStopped = true;
                        EmeraldComponent.m_NavMeshAgent.enabled = false;
                    }
                    shadowProjector.SetActive(true);
                    GetComponent<Animator>().SetTrigger("DeadEnd");
                    GetComponent<EmeraldAIDestroy>().GoThroughGround(3f, deathFallDuration*2f);
                }).SetEase(Ease.InSine);
        }
    }
}