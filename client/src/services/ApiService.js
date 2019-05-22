import axios from 'axios'
import { TokenService } from '@/services'
import SubmissionError from "../utils/SubmissionError";
import LoginError from "./LoginError";

const ApiService = {
    generateListParams(payload){
        if(!payload) return [];
        const sortOrder = payload.descending ? 'desc':'asc';
        const params = [];
        params.push(`page=${payload.page}`);
        if(payload.sortBy){
            params.push(`order[${payload.sortBy}]=${sortOrder}`);
        }
        return params;
    },

    generateUrl(url, params = false){
        const path = process.env.VUE_APP_API_PATH;
        url = `${path}/${url}`;
        if(params){
            url = `${url}?${params.join('&')}`
        }
        url = url.replace(/\/+/gm,'/');
        return url;
    },

    generateFullUrl(url, params){
        const genUrl = this.generateUrl(url, params);
        const baseUrl = axios.defaults.baseURL;
        return `${baseUrl}${genUrl}`;
    },

    init(baseURL) {
        axios.defaults.baseURL = baseURL;
        axios.interceptors.request.use(
            (config) => {
                const url = config.url.replace('api/api', 'api');
                config.url = url;
                return config;
            }
        );
        axios.interceptors.response.use(
            (response) => {
                return response.data;
            },
            (error) => {
                const response = error.response;
                const json = response.data;

                if(json.violations){

                    const errMsg = json['hydra:description'] ? json['hydra:description'] : response.statusText;
                    const errors = { _error: errMsg }
                    json.violations.map(violation =>
                        Object.assign(errors, { [violation.propertyPath]: violation.message }));

                    throw new SubmissionError(errors)
                }

                if(401 === response.status){
                    throw new LoginError(error, json);
                }

                return Promise.reject(error);
            }
        );
    },

    setHeader() {
        axios.defaults.headers.common["Authorization"] = `Bearer ${TokenService.getToken()}`
    },

    removeHeader() {
        axios.defaults.headers.common = {}
    },

    get(resource) {
        return axios.get(resource);
    },

    post(resource, data, options={}) {
        return axios.post(resource, data, options)
    },

    put(resource, data) {
        return axios.put(resource, data);
    },

    delete(resource) {
        return axios.delete(resource)
    },

    /**
     * Perform a custom Axios request.
     *
     * data is an object containing the following properties:
     *  - method
     *  - url
     *  - data ... request payload
     *  - auth (optional)
     *    - username
     *    - password
     **/
    customRequest(data) {
        return axios(data)
    }
}

export default ApiService
