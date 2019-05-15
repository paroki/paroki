<template>
    <v-data-table
        :headers="headers"
        :items="items"
        :pagination.sync="pagination"
        :total-items="totalItems"
        :rows-per-page-items="pagination.rowsPerPageItems"
        :loading="loading"
        min-height="400px"
    >
        <template v-slot:items="props">
            <td v-for="(header, i) in headers" :key="`header-${header.value}-${i}`">
                    <span v-if="header.value==='actions'">
                        <v-icon
                            color="green"
                            small
                            class="mr-2"
                            @click="handleEdit(props.item)"
                            v-if="handleEdit"
                            fab
                        >
                            fas fa-edit
                        </v-icon>
                        <v-icon
                            small
                            @click="handleDelete(props.item)"
                            v-if="handleDelete"
                        >
                            fas fa-trash
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
            handleEdit: {
                type: Function,
                required: false
            },
            handleDelete: {
                type: Function,
                required: false
            },
            actions: {
                type: [Array, Object],
                default: () => {}
            },
            // pager getter/setter name
            pager: {
                type: [Array, Object],
                required: true
            },
            loadPageAction: {
                type: Function,
                required: true
            },
            totalItems: {
                type: Number,
                default: 0
            },
            setPagerAction: {
                type: Function,
                required: true
            }
        },
        computed: {
            pagination: {
                set: function(value){
                    this.setPagerAction(value)
                },
                get: function(){
                    return this.pager;
                }
            }
        },
        watch: {
            pagination: {
                handler(){
                    this.loadPageAction();
                }
            }
        }
    }
</script>
