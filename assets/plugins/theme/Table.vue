<template>
    <v-data-table
        must-sort
        :headers="headers"
        :items="items"
        :pagination.sync="pagination"
        :total-items="totalItems"
        :rows-per-page-items="pagination.rowsPerPageItems"
        :loading="isLoading"
    >
        <template v-slot:items="props">
            <td v-for="(header, i) in headers">
                    <span v-if="header.value==='actions'">
                        <v-icon
                            small
                            class="mr-2"
                            @click="editAction(props.item)"
                            v-if="actions.edit"
                        >
                            edit
                        </v-icon>
                        <v-icon
                            small
                            @click="deleteAction(props.item)"
                            v-if="header.delete"
                        >
                            delete
                        </v-icon>
                    </span>
                    <span v-else>
                        {{props.item[header.value]}}
                    </span>
            </td>
        </template>
        <template v-slot:actions>
            <v-btn
                :to="{ name: 'UserCreate' }"
                color="info"
                align-right
                small
                right
                round
            >
                <v-icon left>arrow_back_ios</v-icon>
                new
            </v-btn>
        </template>

    </v-data-table>
</template>

<script>
    export default {
        name: 'c-table',
        props: {
            headers: {
                type: [Array, Object],
                required: true
            },
            pager: {
                type: [Array, Object],
                required: true
            },
            pageAction: {
                type: Function,
                required: true
            },
            editAction: {
                type: Function,
                required: false
            },
            deleteAction: {
                type: Function,
                required: false
            },
            actions: {
                type: [Array, Object],
                default: () => {}
            }
        },
        data: () => {
            return {
            }
        },
        watch: {
            pagination: {
                handler() {
                    this.$store.dispatch('user/list/default');
                },
                deep: true
            }
        },
        computed: {
            pagination: {
                get: function(){
                    return this.$store.getters['user/list/pager'];
                },
                set: function(value){
                    value.rowsPerPage = 5;
                    this.$store.commit('user/list/pager',value);
                }
            },
            items(){
                return this.$store.getters['user/list/items'];
            },
            totalItems(){
                return this.$store.getters['user/list/view']['totalItems'];
            },
            isLoading() {
                return this.$store.getters['user/list/isLoading'];
            }
        },
        methods: {
        }
    }
</script>
