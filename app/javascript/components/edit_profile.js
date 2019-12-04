const editProfile = () => {
  const editBtn = document.getElementById('edit-btn')
  const saveBtn = document.getElementById('save-btn')

  const currentData = document.getElementById('current-data')
  const editForm = document.getElementById('edit-form')

  editBtn.addEventListener('click', (event) => {
    currentData.classList.add("hide");
    editForm.classList.remove("hide");
    console.log("Edit")
  });

  saveBtn.addEventListener('click', (event) => {
    editForm.classList.add("hide");
    currentData.classList.remove("hide");
    console.log("Save")
  });
}

export { editProfile };
