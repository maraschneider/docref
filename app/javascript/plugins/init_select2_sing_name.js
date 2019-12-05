import $ from 'jquery';
import 'select2';

const initSelect2SingName = () => {
  $('.js-example-basic-single-name').select2({
    placeholder: "Doctor Name",
    allowClear: true
  });
};

export { initSelect2SingName };
