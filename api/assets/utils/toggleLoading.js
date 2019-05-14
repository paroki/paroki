import * as siap from '../modules/global/types';

export default function(commit) {
    commit(`siap/${siap.SIAP_TOGGLE_LOADING}`, null, {root: true});
};
