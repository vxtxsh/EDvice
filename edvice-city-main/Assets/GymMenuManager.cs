using UnityEngine;
using UnityEngine.UI;

public class GymMenuManager : MonoBehaviour
{
    public GameObject quizUI;        // Reference to the Quiz UI Panel
    public GameObject leaderboardUI; // Reference to the Leaderboard UI Panel
    public GameObject gymMenuUI;     // Reference to the Gym Menu Panel

    void Start()
    {
        // Initially, only the Gym Menu should be active
        gymMenuUI.SetActive(true);
        quizUI.SetActive(false);
        leaderboardUI.SetActive(false);
    }

    public void OnStartQuizClicked()
    {
        gymMenuUI.SetActive(false);
        quizUI.SetActive(true);
    }

    public void OnViewLeaderboardClicked()
    {
        gymMenuUI.SetActive(false);
        leaderboardUI.SetActive(true);
    }
}
