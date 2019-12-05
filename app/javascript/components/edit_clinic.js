const editClinic = () => {
  const editClinicBtn = document.getElementById('edit-clinic-btn')
  const saveClinicBtn = document.getElementById('save-clinic-btn')

  const currentClinicData = document.getElementById('current-clinic-data')
  const editClinic = document.getElementById('edit-clinic')

  editClinicBtn.addEventListener('click', (event) => {
    currentClinicData.classList.add("hide");
    editClinic.classList.remove("hide");
  });

  saveClinicBtn.addEventListener('click', (event) => {
    editClinic.classList.add("hide");
    currentClinicData.classList.remove("hide");
  });
}

export { editClinic };
