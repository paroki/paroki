import _ from 'lodash';

const normalizeArray = (items, options = {},  level = 0) => {
    const defaults = {
        defaults: {},
        callback: () => {},
        childrenKey: 'children'
    };
    options = {
        ...defaults,
        ...options
    };

    Array.from(items).forEach( (item, key) => {
        //item = mergeDefaults(item, options.defaults);
        item = _.merge({}, options.defaults, item);

        // handle callback
        options.callback(item,key);

        // parse children
        const children = item[options.childrenKey];
        if(children){
            item[options.childrenKey] = normalizeArray(children,options,level+1);
        }
        items[key] = item;
    });
    return items;
};

export default normalizeArray;
