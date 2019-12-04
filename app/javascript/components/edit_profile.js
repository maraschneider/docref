const editProfile = () => {
  const editProfileBtn = document.getElementById('edit-profile-btn')
  //const saveProfileBtn = document.getElementById('save-profile-btn')

  const currentProfileData = document.getElementById('current-profile-data')
  const editProfile = document.getElementById('edit-profile')

  editProfileBtn.addEventListener('click', (event) => {
    currentProfileData.classList.add("hide");
    editProfile.classList.remove("hide");
    console.log("Edit")
  });

  //saveProfileBtn.addEventListener('click', (event) => {
  //  editProfile.classList.add("hide");
  //  currentProfileData.classList.remove("hide");
  //  console.log("Save")
  //});
}

export { editProfile };
