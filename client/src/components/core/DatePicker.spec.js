import { shallowMount } from "@vue/test-utils";
import { getLocalVue } from "../../../tests/unit/helper";
import DatePicker from './DatePicker';

describe('<c-date-picker/>', () => {
    let localVue;

    beforeEach( () => {
        localVue = getLocalVue();
    });

    it('should rendered properly', () => {
        const handler = jest.fn();
        const wrapper = shallowMount(DatePicker, {
            localVue,
            propsData: {
                data: '2011-08-01',
                handleUpdateField: handler,
                name: 'test'
            }
        });

        const html = wrapper.html();
        const datePicker = wrapper.find({name: 'v-date-picker'});

        datePicker.setData({data: '01/08/2010'});
        datePicker.vm.$emit('input');

        expect(wrapper.vm.formatDate('2010-08-01')).toEqual('01/08/2010');
        expect(wrapper.vm.parseDate('01/08/2010')).toEqual('2010-08-01');

        wrapper.setData({menu: true, date: '2011-08-01'});
        wrapper.vm.handleInput();
        expect(wrapper.vm.menu).toBe(false);
        expect(handler.mock.calls[1][0]).toBe('test');
        expect(handler.mock.calls[1][1]).toBe('2011-08-01');
    });
});
