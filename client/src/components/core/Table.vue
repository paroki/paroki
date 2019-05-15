<template>
    <v-data-table
        v-bind="$attrs"
        :rows-per-page-items="pagination.rowsPerPageItems"
        :pagination.sync="pagination"
        hide-actions
    >
        <template v-slot:items="props">
            <td v-for="(header, i) in $attrs.headers" :key="`header-${header.value}-${i}`">
                    <span v-if="header.value==='actions'">
                        <v-icon
                            color="green"
                            small
                            class="mr-2"
                            @click="handleEdit(props.item)"
                            v-if="handleEdit"
                            fab
                            v-text="$vuetify.icons.edit"
                        >
                        </v-icon>
                        <v-icon
                            small
                            @click="handleDelete(props.item)"
                            v-if="handleDelete"
                            v-text="$vuetify.icons.delete"
                        >
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
