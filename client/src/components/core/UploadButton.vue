<template>
    <div class="upload-button">
        <input
            type="file"
            :name="name"
            :accept="accept"
            :multiple="multiple"
            @change="fileChanged"
            ref="file"
            style="display:none"
        />
        <v-btn
            v-bind="$attrs"
            @click="$refs.file.click()"
            :color="color"
            small
        >
            <v-icon left>mdi-file-upload</v-icon>
            {{label}}
        </v-btn>
    </div>
</template>

<script>

export default {
    name: 'c-upload-button',
    props: {
        accept: {
            default: '*',
            type: String
        },
        name: {
            default: 'uploadFile',
            type: String
        },
        multiple: {
            default: false,
            type: Boolean
        },
        label: {
            type: String,
            default: 'Upload File'
        },
        color: {
            type: String,
            default: 'info'
        }
    },
    
    data: () => {
        return {
            uTitle: null,
            file: null
        }
    },

    methods: {
        uploadFile(file){
            const formData = new FormData();
            formData.append('file',file);
        },
        fileChanged(e){
            if (e) {
                if (e.target.files.length > 0) {
                    if (!this.multiple) {
                        this.uTitle = e.target.files[0].name
                        this.$emit('file-changed', e.target.files[0])
                    } else {
                        let title = ''
                        for (let i = 0; i < e.target.files.length; i++) {
                        title += e.target.files[i].name + ', '
                        }
                        title = title.slice(0, title.length - 2)
                        this.uTitle = title
                        this.$emit('file-changed', e.target.files)
                    }
                } else {
                    this.uTitle = null
                    this.$emit('file-changed')
                }
            }
        },
        clear() {
            document.getElementById(`${this._uid}uploadFile`).value = ''
            this.$emit('file-changed')
            this.uTitle = null
        },
        showFileBrowser(){
            this.file = '';
        }
    }
}
</script>