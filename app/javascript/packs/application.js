import "bootstrap";

import 'select2/dist/css/select2.css';
import { initSelect2 } from '../plugins/init_select2';

import 'mapbox-gl/dist/mapbox-gl.css';
import '@mapbox/mapbox-gl-geocoder/dist/mapbox-gl-geocoder.css';
import { initMapbox } from '../plugins/init_mapbox';
import { initAutocomplete } from '../plugins/init_autocomplete';
import { setActiveClassToFieldChoice } from '../components/set_active_class_to_field_choice';
//import { toggleTagsOnApprovalWhenFilter } from '../components/toggle_tags_on_approval_when_filter';

initMapbox();
initSelect2();
initAutocomplete();
setActiveClassToFieldChoice();
//toggleTagsOnApprovalWhenFilter();
