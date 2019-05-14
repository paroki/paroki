import * as types from './types';
import fetch from '../../utils/fetch';

export const paroki = ({commit}, term) => {
    let url = `/api/reference/search/paroki?terms=${term}`;

    commit(types.TOGGLE_LOADING);
    return fetch(url)
        .then(response => response.json())
        .then((data) => {
            commit(types.PAROKI,data['hydra:member']);
            commit(types.TOGGLE_LOADING)
        })
        .catch( (e) => {

            commit(types.TOGGLE_LOADING)
        });
}
