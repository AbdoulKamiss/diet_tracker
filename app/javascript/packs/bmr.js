function bmr() {
  const calories = document.querySelector(".bmr-calculator .result .calories");
  const calculateBtn = document.querySelector(
    ".bmr-calculator .result .calculate-btn"
  );
  const age = document.querySelector(".bmr-calculator form #age");
  const height = document.querySelector(".bmr-calculator form #height");
  const weight = document.querySelector(".bmr-calculator form #weight");
  const errorMessage = document.querySelector(
    ".bmr-calculator .result .error-message"
  );
  const interpretation = document.querySelector(".interpretation-message");

  const calculateBMR = (weight, height, age, gender) => {
    if (gender == "male") {
      return 88.362 + 13.397 * weight + 4.799 * height - 5.677 * age;
    }

    return 447.593 + 9.247 * weight + 3.098 * height - 4.33 * age;
  };

  calculateBtn.addEventListener("click", () => {
    if (
      age.classList.contains("invalid") ||
      height.classList.contains("invalid") ||
      weight.classList.contains("invalid")
    ) {
      errorMessage.classList.add("active");
      return;
    }

    errorMessage.classList.remove("active");

    let genderValue = document.querySelector(
      ".bmr-calculator form input[name='gender']:checked"
    ).value;

    let BMR = calculateBMR(weight.value, height.value, age.value, genderValue);

    calories.innerHTML = BMR.toLocaleString("en-US");

    let sedentary = (BMR * 1.2).toFixed(2);
    let lightlyActive = (BMR * 1.375).toFixed(2);
    let moderatelyActive = (BMR * 1.55).toFixed(2);
    let veryActive = (BMR * 1.725).toFixed(2);
    let superActive = (BMR * 1.9).toFixed(2);

    interpretation.innerHTML = `<table class="table table-striped">
                                  <thead class="table-success">
                                    <tr>
                                      <th>Activity Level</th>
                                      <th>Description</th>
                                      <th>Calories</th>
                                    </tr>  
                                  </thead>
                                  <tbody>
                                    <tr>
                                      <td>Sedentary</td>
                                      <td>Little to no exercise</td>
                                      <td>${sedentary} Kcal/day</td>
                                    </tr>
                                    <tr>
                                      <td>Lightly Active</td>
                                      <td>Light exercise or sports 1-3 days a week</td>
                                      <td>${lightlyActive} Kcal/day</td>
                                    </tr>
                                    <tr>
                                      <td>Moderately Active</td>
                                      <td>Moderate exercise or sports 3-5 days a week</td>
                                      <td>${moderatelyActive} Kcal/day</td>
                                    </tr>
                                    <tr>
                                      <td>Very Active</td>
                                      <td>Hard exercise or sports 6-7 days a week</td>
                                      <td>${veryActive} Kcal/day</td>
                                    </tr>
                                    <tr>
                                      <td>Super Active</td>
                                      <td>Very hard exercise or physical job, and training</td>
                                      <td>${superActive} Kcal/day</td>
                                    </tr>
                                  </tbody>
                                </table>`;
  });

  // Input Validation

  age.addEventListener("input", (e) => {
    let ageValue = e.target.value;

    if (!ageValue || isNaN(ageValue) || ageValue < 10 || ageValue > 100) {
      age.classList.add("invalid");
    } else {
      age.classList.remove("invalid");
    }
  });

  height.addEventListener("input", (e) => {
    let heightValue = e.target.value;

    if (!heightValue || isNaN(heightValue) || heightValue < 0) {
      height.classList.add("invalid");
    } else {
      height.classList.remove("invalid");
    }
  });

  weight.addEventListener("input", (e) => {
    let weightValue = e.target.value;

    if (!weightValue || isNaN(weightValue) || weightValue < 0) {
      weight.classList.add("invalid");
    } else {
      weight.classList.remove("invalid");
    }
  });
}
window.onload = bmr;
