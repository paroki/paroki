<template>
    <v-layout>
        <v-flex width="100px">
            <v-navigation-drawer permanent>
                <v-list>
                    <v-list-tile
                        v-for="item in items"
                        :name="item.title"
                        :key="item.title"
                        @click="activateComponent(item)"
                        :active="active === item.component"
                    >
                        <v-list-tile-action>
                            <v-icon>{{ item.icon }}</v-icon>
                        </v-list-tile-action>

                        <v-list-tile-content>
                            <v-list-tile-title>{{ item.title }}</v-list-tile-title>
                        </v-list-tile-content>
                    </v-list-tile>
                </v-list>
            </v-navigation-drawer>
        </v-flex>
        <v-flex md8>
            <component
                class="sub-item"
                v-bind:is="active"
                @update-profile="handleUpdateProfile"
                @update-password="handleUpdatePassword"
            />
        </v-flex>
    </v-layout>
</template>

<script>
    import { mapActions, mapGetters } from 'vuex';
    import { TokenService } from '@/services';
    import ProfileForm from './Form/Biodata';
    import ProfilePassword from './Form/Password';
    import Avatar from './Form/Avatar';

    export default {
        components: {
            'profile-form': ProfileForm,
            'profile-password': ProfilePassword,
            'avatar': Avatar
        },
        computed: {
            ...mapGetters({
                retrieved: 'user/update/retrieved',
                error: 'user/update/error'
            })
        },
        data: () => {
            return {
                items: [
                    { title: 'Biodata', icon: 'mdi-dashboard', component: 'profile-form' },
                    { title: 'Foto', icon: 'mdi-person', component: 'avatar' },
                    {
                        title: 'Password',
                        icon: 'mdi-lock',
                        component: 'profile-password',
                        handleUpdate: 'user/update/profile'
                    }
                ],
                active: 'profile-form'
            }
        },
        created() {
            const credentials = TokenService.getCredentials();
            this.getProfile(credentials.id);

        },
        beforeDestroy(){
            this.updateReset();
            this.resetError();
        },
        methods: {
            ...mapActions({
                getProfile: 'user/update/getProfile',
                updateProfile: 'user/update/profile',
                profilePassword: 'user/update/profilePassword',
                snackbarSuccess: 'siap/snackbarSuccess',
                snackbarError: 'siap/snackbarError',
                updateReset: 'user/update/reset',
                resetError: 'user/update/resetError'
            }),
            handleUpdateProfile(){
                this.updateProfile();
                if(!this.error){
                    this.snackbarSuccess('Profil berhasil disimpan!');
                }else{
                    this.snackbarError('Gagal menyimpan profil');
                }
            },
            handleUpdatePassword(payload){
                this.profilePassword(payload);
                if(!this.error){
                    this.snackbarSuccess('Password berhasil diperbaharui!');
                }else{
                    this.snackbarError('Gagal menyimpan password');
                }
            },
            activateComponent(item){
                this.active = item.component;
            }
        }
    }
</script>
