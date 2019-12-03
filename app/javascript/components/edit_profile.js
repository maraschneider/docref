const editProfile = () => {
  const editBtn = document.getElementById('edit-btn')
  const saveBtn = document.getElementById('save-btn')

  const currentData = document.getElementById('current-data')
  const editField = document.getElementById('edit-form')

  editBtn.addEventListener('click', (event) => {
    console.log("CLICK")
    event.currentData.classList.add("hide");
    event.editField.classList.remove("hide");
  });
}

export { editProfile };
