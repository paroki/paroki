<template>
    <b-form @submit.prevent="handleSubmit(item)">
        <div v-for="field in fields">
            <b-form-group
                :label="field.label"
                :label-for="'fr'&&field.name"
            >
                <b-input
                    type="text"
                    :v-model="item[field.name]"
                    :v-if="field.type === 'text'"
                ></b-input>
            </b-form-group>
        </div>
        <div>
            <b-form-group
                label="Nama Lengkap Tanpa Title"
                for-label="frNama"
            >
                <b-input
                    id="frNama"
                    type="text"
                    :class="['form-control', isInvalid('nama') ? 'is-invalid' : '']"
                    v-model="item['nama']"
                ></b-input>
                <div
                    v-if="isInvalid('nama')"
                    class="invalid-feedback">{{ violations.nama }}</div>
            </b-form-group>

        </div>
    </b-form>
</template>
<script>
    export default {
        props: {
            fields: {
                type: [Array, Object],
                default: () => []
            },
            handleSubmit: {
                type: Function,
                required: true
            },

            handleUpdateField: {
                type: Function,
                required: true
            },

            values: {
                type: Object,
                required: true
            },

            errors: {
                type: Object,
                default: () => {}
            },

            initialValues: {
                type: Object,
                default: () => {}
            }
        },

        computed: {
            // eslint-disable-next-line
            item () {
                return this.initialValues || this.values
            },

            violations () {
                return this.errors || {}
            }
        },

        methods: {
            isInvalid (key) {
                return Object.keys(this.violations).length > 0 && this.violations[key]
            },
            getItem(item, name){
                return item && item[name];
            }
        }
    }
</script>
