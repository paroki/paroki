import * as siap from '../store/siap/types';

export default function(commit) {
    commit(`siap/${siap.SIAP_TOGGLE_LOADING}`, null, {root: true});
};
