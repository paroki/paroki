import normalizeArray from '../../../src/utils/normalizeArray';

describe('normalizeArray', () => {
    let items = [];
    let options = [];

    beforeEach( () => {
        items = [{
            foo: 'bar',
            some: 'data',
            meta: {
                some: { default: 'value' }
            }
        }];

        options = {
            defaults: {
                default: 'value',
                meta: {
                    requiresAuth: true
                }
            }
        };
    });

    it('should normalize array with defaults value', () => {
        const normalized = normalizeArray(items,options)[0];
        expect(normalized.default).toEqual('value');
        expect(normalized.foo).toEqual('bar');
        expect(normalized.some).toEqual('data');
        expect(normalized.meta.requiresAuth).toBeTruthy();
    });

    it('should normalize array with callback', () => {
        options.callback = (item, key) => {
            item.fromCallback = true
            item.key = key;
        };

        const normalized = normalizeArray(items,options)[0];
        expect(normalized.fromCallback).toBeTruthy();
        expect(normalized.key).toEqual(0);
    });

    it('should normalize array with their childrens', () => {
        const data = [
            {
                lorem: 'ipsum',
                children: items
            }
        ];
        const normalized = normalizeArray(data, options)[0];
        expect(normalized.lorem).toEqual('ipsum');
        expect(normalized.children).toBeDefined();

        const children = normalized.children[0];
        expect(children.default).toEqual('value');
        expect(children.foo).toEqual('bar');
    });
});
