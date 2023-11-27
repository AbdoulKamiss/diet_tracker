function bmi() {
  const bmiResult = document.querySelector(".bmi-calculator .result .bmi");
  const calculateBtnBmi = document.querySelector(
    ".bmi-calculator .result .calculate-btn"
  );
  const weight = document.querySelector(".bmi-calculator form #weight");
  const height = document.querySelector(".bmi-calculator form #height");
  const errorMessage = document.querySelector(
    ".bmi-calculator .result .error-message"
  );
  const interpretation = document.querySelector(
    ".bmi-calculator .result .interpretation-message"
  );

  // BMI = weight (kg) / (height (m) * height (m))

  const calculateBMI = (weight, height) => {
    return weight / (height * height);
  };

  calculateBtnBmi.addEventListener("click", () => {
    if (
      weight.classList.contains("invalid") ||
      height.classList.contains("invalid")
    ) {
      errorMessage.classList.add("active");
      return;
    }

    errorMessage.classList.remove("active");

    let weightValue = weight.value;
    let heightValue = height.value;

    if (
      !weightValue ||
      isNaN(weightValue) ||
      weightValue <= 0 ||
      !heightValue ||
      isNaN(heightValue) ||
      heightValue <= 0
    ) {
      errorMessage.classList.add("active");
      return;
    }

    let BMI = calculateBMI(weightValue, heightValue / 100); // Convert height from cm to meters

    bmiResult.innerHTML = BMI.toFixed(2); // Display BMI with 2 decimal places

    if (BMI < 18.5) {
      interpretation.innerHTML =
        "Underweight</br>You should consult a healthcare professional.";
    } else if (BMI >= 18.5 && BMI < 25) {
      interpretation.innerHTML =
        "Normal weight</br>You are healthy. Keep maintaining a healthy lifestyle.";
    } else if (BMI >= 25 && BMI < 30) {
      interpretation.innerHTML =
        "Overweight</br>It's advised to monitor your diet and exercise.";
    } else if (BMI >= 30 && BMI < 35) {
      interpretation.innerHTML =
        "Obesity Class 1</br>Consult a healthcare professional for weight management advice.";
    } else if (BMI >= 35 && BMI < 40) {
      interpretation.innerHTML =
        "Obesity Class 2</br>Medical follow-up is necessary. Consult a doctor.";
    } else {
      interpretation.innerHTML =
        "Obesity Class 3</br>This is severe obesity. Consult a doctor as soon as possible.";
    }
  });

  // Ajouter des interprétations de l'IMC (BMI)

  // Input Validation

  weight.addEventListener("input", (e) => {
    let weightValue = e.target.value;

    if (!weightValue || isNaN(weightValue) || weightValue <= 0) {
      weight.classList.add("invalid");
    } else {
      weight.classList.remove("invalid");
    }
  });

  height.addEventListener("input", (e) => {
    let heightValue = e.target.value;

    if (!heightValue || isNaN(heightValue) || heightValue <= 0) {
      height.classList.add("invalid");
    } else {
      height.classList.remove("invalid");
    }
  });
}
window.onload = bmi;
