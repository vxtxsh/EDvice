using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class LeaderboardManager : MonoBehaviour
{
    public static LeaderboardManager instance;

    public List<int> scores = new List<int>();
    public Text leaderboardText;

    void Awake()
    {
        if (instance == null)
        {
            instance = this;
            DontDestroyOnLoad(gameObject);
        }
        else
        {
            Destroy(gameObject);
        }
    }

    public void UpdateLeaderboard(int newScore)
    {
        scores.Add(newScore);
        scores.Sort((a, b) => b.CompareTo(a)); // Sort descending

        DisplayLeaderboard();
    }

    void DisplayLeaderboard()
    {
        leaderboardText.text = "Leaderboard:\n";
        for (int i = 0; i < scores.Count && i < 10; i++) // Show top 10 scores
        {
            leaderboardText.text += (i + 1) + ". " + scores[i] + "\n";
        }
    }
}
