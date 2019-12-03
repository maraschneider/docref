const toggleTagsOnApprovalWhenFilter = () => {
  //const url_string = window.location.href
  //const url = new URL(url_string);
  //const field_params = url.searchParams.get("approval_field%5B%5D");
  //console.log(field_params);

//  tags.forEach((tag) => {
//    if (tag.innerText === field_params) {
//       tag.classList.add('active');
//    } else {
//      tag.classList.remove('active');
//    }
//  });
//};

  const tags = document.querySelectorAll("tag");
  tags.forEach((tag) => {
  const tagsChoice = document.getElementById('tag-filter')
    tagsChoice.addEventListener('change', (event) => {
      tag.classList.toggle("active");
    });
  });
};

export { toggleTagsOnApprovalWhenFilter };
