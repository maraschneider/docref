import $ from 'jquery';
import 'select2';

const initSelect2Multi = () => {
  $('.js-example-basic-multiple').select2({
    placeholder: "Field"
  });
};

export { initSelect2Multi };

