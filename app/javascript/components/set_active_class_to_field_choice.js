const setActiveClassToFieldChoice = () => {
  const fieldChoices = document.querySelectorAll(".field-choice");
  fieldChoices.forEach((field) => {
    field.addEventListener('click', (event) => {
      console.log(event);
      field.classList.toggle("active");
    });
  })
}

export { setActiveClassToFieldChoice };
