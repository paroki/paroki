import DefaultContainer from './DefaultContainer';
import LoadingOverlay  from './LoadingOverlay';
import SimpleDialog from './SimpleDialog';

const components = [
    DefaultContainer,
    LoadingOverlay,
    SimpleDialog,
];

export default {
    install(Vue){
        components.forEach((item) => {
            Vue.component(item.name, item);
        });
    }
}

export {
    DefaultContainer,
    LoadingOverlay,
    SimpleDialog
}
