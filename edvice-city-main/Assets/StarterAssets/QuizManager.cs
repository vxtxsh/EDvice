using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

[System.Serializable]
public class Question
{
    public string questionText;
    public string[] answers;
    public int correctAnswerIndex;
}

public class QuizManager : MonoBehaviour
{
    public List<Question> questions;
    private int currentQuestionIndex = 0;
    private int score = 0;

    public GameObject questionUI;
    public Text questionText;
    public Button[] answerButtons;
    public GameObject certificationUI;

    void Start()
    {
        if (questions != null && questions.Count > 0)
        {
            DisplayQuestion();
        }
        else
        {
            Debug.LogError("No questions available in the quiz.");
        }
    }

    void DisplayQuestion()
    {
        if (currentQuestionIndex < questions.Count)
        {
            Question currentQuestion = questions[currentQuestionIndex];
            questionText.text = currentQuestion.questionText;
            for (int i = 0; i < answerButtons.Length; i++)
            {
                if (i < currentQuestion.answers.Length)
                {
                    answerButtons[i].GetComponentInChildren<Text>().text = currentQuestion.answers[i];
                    int index = i; // Capture index for the closure
                    answerButtons[i].onClick.RemoveAllListeners();
                    answerButtons[i].onClick.AddListener(() => OnAnswerSelected(index));
                    answerButtons[i].gameObject.SetActive(true);
                }
                else
                {
                    answerButtons[i].gameObject.SetActive(false); // Hide unused buttons
                }
            }
        }
        else
        {
            Debug.LogError("Invalid question index.");
        }
    }

    void OnAnswerSelected(int index)
    {
        if (index == questions[currentQuestionIndex].correctAnswerIndex)
        {
            score++;
        }
        currentQuestionIndex++;
        if (currentQuestionIndex < questions.Count)
        {
            DisplayQuestion();
        }
        else
        {
            EndQuiz();
        }
    }

    void EndQuiz()
    {
        questionUI.SetActive(false);
        Debug.Log("Quiz Finished! Score: " + score);

        // Certification based on score
        if (score >= 8) // Adjust the threshold based on the number of questions
        {
            Debug.Log("Certification Earned!");
            DisplayCertificate();
        }

        // Call the leaderboard update
        if (LeaderboardManager.instance != null)
        {
            LeaderboardManager.instance.UpdateLeaderboard(score);
        }
        else
        {
            Debug.LogError("LeaderboardManager instance not found.");
        }
    }

    void DisplayCertificate()
    {
        if (certificationUI != null)
        {
            certificationUI.SetActive(true);
            // Optionally save the certification status in player data
        }
        else
        {
            Debug.LogWarning("Certification UI not assigned.");
        }
    }
}
