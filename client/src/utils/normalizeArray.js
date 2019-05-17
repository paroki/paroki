const normalizeArray = (items, defaults, callback = () => {}, level = 0) => {
    Array.from(items).forEach( (item, key) => {
        item = {
            ...defaults,
            ...item
        };
        callback(item,key);
        items[key] = item;
    });
    return items;
}

export default normalizeArray;
