<template xmlns:v-slot="http://www.w3.org/1999/XSL/Transform">
    <v-form>
        <template v-for="field in fields">
            <div :key="field.name">
                <v-text-field
                    :label="field.label"
                    :name="field.name"
                    :placeholder="field.placeholder"
                    :error="isInvalid(field.name)"
                    :error-messages="getError(field.name)"
                    v-model="item[field.name]"
                    v-if="field.type === 'text'"
                    :type="field.type"
                    class="purple-input"
                    @input="handleUpdateField(field.name, $event)">
                ></v-text-field>
                <v-text-field
                    :label="field.label"
                    :name="field.name"
                    :placeholder="field.placeholder"
                    :error="isInvalid(field.name)"
                    :error-messages="getError(field.name)"
                    v-model.number="item[field.name]"
                    v-if="field.type === 'number'"
                    :type="field.type"
                    class="purple-input"
                    :mask="field.mask"
                    @input="handleUpdateField(field.name)">
                    ></v-text-field>
                <v-text-field
                    :label="field.label"
                    :name="field.name"
                    :placeholder="field.placeholder"
                    type="password"
                    v-model="item[field.name]"
                    v-if="field.type === 'password'"
                    :error="isInvalid(field.name)"
                    :error-messages="getError(field.name)"
                    @input="handleUpdateField(field.name)">
                ></v-text-field>
                <c-datepicker
                    v-if="field.type === 'date'"
                    :name="field.name"
                    :label="field.label"
                    :format="field.format"
                    :data="item[field.name]"
                    :error="isInvalid(field.name)"
                    :error-messages="getError(field.name)"
                    :handle-update-field="handleUpdateField">
                ></c-datepicker>
                <v-radio-group
                    v-model="item[field.name]"
                    v-if="field.type === 'radio'"
                    :label="field.label"
                    :error="isInvalid(field.name)"
                    :error-messages="getError(field.name)"
                    @input="handleUpdateField(field.name)"
                >
                    <v-radio
                        v-for="(option, index) in field.options"
                        :key="index"
                        :label="option.label"
                        :value="option.value"
                    ></v-radio>
                </v-radio-group>

                <v-item-group
                    v-if="field.type === 'array-checkbox'"
                >
                    {{field.label}}
                    <v-checkbox
                        v-for="(option, index) in field.options"
                        v-model="item[field.name]"
                        :key="`${field.name}_${index}`"
                        :label="option.label"
                        :value="option.value"
                        :error="isInvalid(field.name)"
                        :error-messages="getError(field.name)"
                        @input="handleUpdateField(field.name)">
                    ></v-checkbox>
                </v-item-group>
                <c-autocomplete
                    v-if="field.type === 'autocomplete'"
                    :item="item[field.name]"
                    :label="field.label"
                    :error="isInvalid(field.name)"
                    :error-messages="getError(field.name)"
                    @input="handleUpdateField(field.name)">
                ></c-autocomplete>
            </div>
        </template>
    </v-form>
</template>

<script>
    export default {
        name: 'c-form',
        props: {
            fields: {
                type: [Array, Object],
                default: () => []
            },
            values: {
                type: [Array, Object],
                required: true
            },
            errors: {
                type: Object,
                default: () => {}
            },
            initialValues: {
                type: Object,
                default: () => {}
            },
            handleUpdateField: {
                type: Function,
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
                return Object.keys(this.violations).length > 0 && !!this.violations[key];
            },
            getError(key){
                return this.violations[key];
            }
        }

    }
</script>
