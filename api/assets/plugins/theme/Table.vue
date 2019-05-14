<template>
    <v-data-table
        :headers="headers"
        :items="items"
        :pagination.sync="pagination"
        :total-items="totalItems"
        :rows-per-page-items="pagination.rowsPerPageItems"
        :loading="isLoading"
        min-height="400px"
    >
        <template v-slot:items="props">
            <td v-for="(header, i) in headers">
                    <span v-if="header.value==='actions'">
                        <v-icon
                            color="green"
                            small
                            class="mr-2"
                            @click="editAction(props.item)"
                            v-if="actions.edit"
                            fab
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

    </v-data-table>
</template>

<script>
    export default {
        name: 'c-table',
        props: {
            items: {
                type: [Array, Object],
                required: true
            },
            headers: {
                type: [Array, Object],
                required: true
            },
            loading: {
                type: Boolean,
                default: false
            },
            // pager getter/setter name
            pager: {
                type: String,
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
            },
            totalItems: {
                type: Number,
                default: 0
            }
        },
        data: () => {
            return {
            }
        },
        watch: {
            pagination: {
                handler() {
                    this.pageAction();
                },
                deep: true
            }
        },
        computed: {
            pagination: {
                get: function(){
                    return this.$store.getters[this.pager];
                },
                set: function(value){
                    value.rowsPerPage = 5;
                    this.$store.commit(this.pager,value);
                }
            },
            isLoading() {
                return this.$store.getters['user/list/isLoading'];
            }
        },
        methods: {
        }
    }
</script>
