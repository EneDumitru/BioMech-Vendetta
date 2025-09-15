using Andtech.ProTracer;
using System.Collections;
using UnityEngine;

public class TracerDefault : MonoBehaviour
{
	public float Speed => 10.0F + (tracerSpeed - 1) * 50.0F;
	public float RotationSpeed => 72.0F;
	public float TimeBetweenShots => 1.0F;

	[Header("Prefabs")]
	[SerializeField]
	[Tooltip("The Bullet prefab to spawn.")]
	private Bullet bulletPrefab = default;
	[SerializeField]
	[Tooltip("The Smoke Trail prefab to spawn.")]
	private SmokeTrail smokeTrailPrefab = default;
	[Header("Demo Settings")]

	[Header("Raycast Settings")]
	[SerializeField]
	[Tooltip("The maximum raycast distance.")]
	private float maxQueryDistance = 300.0F;
	[Header("Tracer Settings")]
	[SerializeField]
	[Tooltip("The speed of the tracer graphics.")]
	[Range(1, 10)]
	private int tracerSpeed = 3;


	private void OnEnable()
	{
		Fire();
	}


	public void Fire()
	{
		// Compute tracer parameters
		float speed = Speed;

		// Instantiate the tracer graphics
		Bullet bullet = Instantiate(bulletPrefab);
		SmokeTrail smokeTrail = Instantiate(smokeTrailPrefab);

		// Setup callbacks
		bullet.Completed += OnCompleted;
		smokeTrail.Completed += OnCompleted;

		// Use different tracer drawing methods depending on the raycast
		if (Physics.Raycast(transform.position, transform.forward, out RaycastHit hitInfo, maxQueryDistance))
		{
			// Since start and end point are known, use DrawLine
			bullet.DrawLine(transform.position, hitInfo.point, speed, 0);
			smokeTrail.DrawLine(transform.position, hitInfo.point, speed, 0);

			// Setup impact callback
			bullet.Arrived += OnImpact;

			void OnImpact(object sender, System.EventArgs e)
			{
				// Handle impact event here
				Debug.DrawRay(hitInfo.point, hitInfo.normal, Color.red, 0.5F);
			}
		}
		else
		{
			// Since we have no end point, use DrawRay
			bullet.DrawRay(transform.position, transform.forward, speed, maxQueryDistance, 0, false);
			smokeTrail.DrawRay(transform.position, transform.forward, speed, 25.0F, 0);
		}
	}

	private void OnCompleted(object sender, System.EventArgs e)
	{
		// Handle complete event here
		if (sender is TracerObject tracerObject)
		{
			Destroy(tracerObject.gameObject);
		}
	}

	private float CalculateStroboscopicOffset(float speed) => speed * Time.smoothDeltaTime;
}
