import ApiService from '@/services/ApiService';
import axios from 'axios';

describe('ApiService', () => {
    it('should initialized properly', () => {
        //const entrypoint = 'http://localhost';
        //const url = new URL('/api/user', entrypoint).toString();
        //expect(url).toMatch('http://localhost/api/user');
        ApiService.init('http://localhost');
        const defaults = axios.defaults;
        expect(defaults.baseURL).toMatch('http://localhost');
    })
})
