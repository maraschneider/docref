import $ from 'jquery';
import 'select2';

const initSelect2Sing = () => {
  $('.js-example-basic-single').select2({
    placeholder: "Specialty",
    allowClear: true
  });
};

export { initSelect2Sing };
