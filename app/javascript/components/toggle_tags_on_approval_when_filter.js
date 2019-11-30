const toggleTagsOnApprovalWhenFilter = () => {
  const tagChoices = document.querySelectorAll(".tag");
  tagChoices.forEach((tag) => {
    document.querySelectorAll('#tag-filter').addEventListener('change', (event) => {
      tag.classList.toggle("active");
  });
};

export { toggleTagsOnApprovalWhenFilter };
