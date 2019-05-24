import { shallowMount } from "@vue/test-utils";
import { getLocalVue } from "../../../tests/unit/helper";
import Card from './Card';

describe('<c-card/>', () => {
    let localVue;

    beforeEach( () => {
        localVue = getLocalVue();
    });

    it('should renders properly', () => {
        const wrapper = shallowMount(Card,{
            localVue,
            propsData: {
                title: 'Hello World',
                text: 'Foo Bar'
            }
        });

        expect(wrapper.find('h4.title').text()).toContain('Hello World');
        expect(wrapper.find('p.category').text()).toContain('Foo Bar')
    })
});
