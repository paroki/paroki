<template>
    <v-autocomplete
        v-model="item"
        :loading="loading"
        :items="items"
        item-text="nama"
        item-value="id"
        :search-input.sync="search"
        flat
        hide-no-data
        :label="label"
        solo-inverted
        class="grey lighten-4"
    ></v-autocomplete>
</template>
<script>
    import { mapActions, mapGetters } from 'vuex';

    export default {
        name: 'c-autocomplete',
        props: {
            item: {
                type: [Array, Object, String],
                default: () => {}
            },
            label: {
                type: String,
                default: ''
            }
        },
        data () {
            return {
                loading: false,
                //items: [],
                search: null,
                select: null,
                terms: null
            }
        },
        computed: {
            ...mapGetters({
                items: 'autocomplete/paroki',
                isLoading: 'autocomplete/loading'
            })
        },
        watch: {
            search (val) {
                if(val && val !== this.select && val.length >= 3){
                    this.terms = val;
                    this.doSearch(this.terms).then(() => {
                    })
                }
            }
        },
        methods: {
            ...mapActions({
                doSearch: 'autocomplete/paroki'
            }),
            getItemText(item){
                return `${item['nama']} / Gereja ${item['namaGereja']} / ${item['kota']}`;
                //return item['nama'];
            }
        }
    }
</script>
