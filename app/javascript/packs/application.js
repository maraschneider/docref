import "bootstrap";

import 'select2/dist/css/select2.css';
import { initSelect2Multi } from '../plugins/init_select2_multi';
import { initSelect2Sing } from '../plugins/init_select2_sing';
import { initSelect2SingName } from '../plugins/init_select2_sing_name';

import 'mapbox-gl/dist/mapbox-gl.css';
import '@mapbox/mapbox-gl-geocoder/dist/mapbox-gl-geocoder.css';
import { initMapbox } from '../plugins/init_mapbox';
import { initAutocomplete } from '../plugins/init_autocomplete';

import { setActiveClassToFieldChoice } from '../components/set_active_class_to_field_choice';
//import { toggleTagsOnApprovalWhenFilter } from '../components/toggle_tags_on_approval_when_filter';
import { editProfile } from '../components/edit_profile';
import { editClinic } from '../components/edit_clinic';

initMapbox();
initSelect2Multi();
initSelect2Sing();
initSelect2SingName();
initAutocomplete();

setActiveClassToFieldChoice();
//toggleTagsOnApprovalWhenFilter();
editProfile();
editClinic();
