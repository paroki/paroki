import { getLocalVue, getRouter } from '../../../tests/unit/helper';
import { shallowMount, mount } from '@vue/test-utils';
import UploadButton from './UploadButton';

describe('UploadButton', () => {
    let localVue;
    let store;
    let wrapper;

    beforeEach( () => {
        localVue = getLocalVue();
    });

    it('should rendered properly', () => {
        const handleUpload = jest.fn();
        wrapper = shallowMount(UploadButton, {
            localVue,
            propsData: {
                'file-update': handleUpload
            }
        });

        const input = wrapper.find('input');
        
        expect(UploadButton.name).toEqual('c-upload-button');
        expect(handleUpload.call.length).toBe(1);
    });
});