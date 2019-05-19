import Card from './core/Card';
import DatePicker from './core/DatePicker';
import Drawer from './core/Drawer';
import DrawerItem from './core/DrawerItem';
import Form from './core/Form';
import Pagination from './core/Pagination';
import SimpleDialog from './core/SimpleDialog';
import Snackbar from './core/Snackbar';
import Table from './core/Table';
import Toolbar from './core/Toolbar';
import Offset from './helper/Offset';

const components = [
    Card,
    DatePicker,
    Drawer,
    DrawerItem,
    Form,
    Pagination,
    SimpleDialog,
    Snackbar,
    Table,
    Toolbar,
    Offset
];

export default {

    install(Vue){
        components.forEach( (item) => {
            Vue.component(item.name, item);
        });
    }
}


export {
    Card,
    DatePicker,
    Drawer,
    DrawerItem,
    Form,
    Pagination,
    SimpleDialog,
    Snackbar,
    Table,
    Toolbar,
    Offset
}
