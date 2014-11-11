var currentScore = 0;
var goalScore = 0;

function setScore(score)
{
    goalScore = score;
    setTimeout(updateScore, 1000);
}

function updateScore()
{
    currentScore = currentScore + 13;
    currentScore = Math.min(currentScore, goalScore);

    document.getElementById("score").innerHTML = currentScore;

    if(currentScore < goalScore)
    {
        setTimeout(updateScore, 100);
    }
    else
    {
        setTimeout(function() {  document.getElementById("continue").style.display = "block"; }, 1000);
    }
}

function setLevel(level)
{
    document.getElementById("lvl").innerHTML = level;
}
