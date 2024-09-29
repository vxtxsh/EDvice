using UnityEngine;
using UnityEngine.UI;

public class VideoTrigger3 : MonoBehaviour
{
    public GameObject player;  // Reference to the player object
    public Button playButton;  // Reference to the UI button
    public string youtubeUrl = "https://youtu.be/I5srDu75h_M?si=TWCQMPzMYByFgUBk";

    void Start()
    {
        playButton.gameObject.SetActive(false);  // Hide the button initially
        playButton.onClick.AddListener(OpenYoutubeLink);  // Assign the function to button click
    }

    void OnTriggerEnter(Collider other)
    {
        if (other.gameObject == player)  // When player enters the trigger zone
        {
            playButton.gameObject.SetActive(true);  // Show the button
        }
    }

    void OnTriggerExit(Collider other)
    {
        if (other.gameObject == player)  // When player leaves the trigger zone
        {
            playButton.gameObject.SetActive(false);  // Hide the button
        }
    }

    void OpenYoutubeLink()
    {
        Application.OpenURL(youtubeUrl);  // Open YouTube link in the browser
    }
}