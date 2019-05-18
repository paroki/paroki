import Vue from 'vue'
import Card from './core/Card';
import DatePicker from './core/DatePicker';
import Drawer from './core/Drawer';
import DrawerItem from './core/DrawerItem';
import Form from './core/Form';
import Pagination from './core/Pagination';
import SimpleDialog from './core/SimpleDialog';
import SnackBar from './core/SnackBar';
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
  SnackBar,
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
