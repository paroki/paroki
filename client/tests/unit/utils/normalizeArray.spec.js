import normalizeArray from '../../../src/utils/normalizeArray';

describe('normalizeArray', () => {
    const items = [{
        foo: 'bar',
        some: 'data'
    }];

    const defaults = {
        hello: 'world'
    };

    it('should normalize array with defaults value', () => {
        const normalized = normalizeArray(items,defaults)[0];

        expect(normalized.hello).toEqual('world');
        expect(normalized.foo).toEqual('bar');
        expect(normalized.some).toEqual('data');
    });

    it('should normalize array with callback', () => {


        const callback = (item, key) => {
            item.fromCallback = true
            item.key = key;
        };

        const normalized = normalizeArray(items,defaults, callback)[0];
        expect(normalized.fromCallback).toBeTruthy();
        expect(normalized.key).toEqual(0);
    });
});
