using UnityEngine;

public class StadiumTrigger : MonoBehaviour
{
    public GameObject gymMenuUI;  // Reference to the Gym Menu Panel

    void OnTriggerEnter(Collider other)
    {
        if (other.CompareTag("Player")) // Assuming your player has a "Player" tag
        {
            gymMenuUI.SetActive(true);
        }
    }
}
