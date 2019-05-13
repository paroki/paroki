import Form from './Form';
import Table from './Table';
import Navbar from './Navbar';
import DatePicker from './DatePicker';
import Autocomplete from './Autocomplete';
import Snackbar from './Snackbar';

export default {
    install(Vue){
        Vue.component('c-form',Form);
        Vue.component('c-table',Table);
        Vue.component('c-navbar',Navbar);
        Vue.component('c-datepicker',DatePicker);
        Vue.component('c-autocomplete',Autocomplete);
        Vue.component('c-snackbar',Snackbar);
    }
};

export {
    Form,
    Table,
    Navbar,
    DatePicker,
    Autocomplete
}

