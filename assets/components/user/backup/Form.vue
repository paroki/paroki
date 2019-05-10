<template>
  <form @submit.prevent="handleSubmit(item)">
    <div class="form-group">
      <label
        for="user_nama"
        class="form-control-label">nama</label>
      <input
        id="user_nama"
        v-model="item.nama"
        :class="['form-control', isInvalid('nama') ? 'is-invalid' : '']"
        type="text"
        placeholder="Nama lengkap pengguna"
        @input="handleUpdateField('nama', $event.target.value)">
      <div
        v-if="isInvalid('nama')"
        class="invalid-feedback">{{ violations.nama }}</div>
    </div>
    <div class="form-group">
      <label
        for="user_paroki"
        class="form-control-label">paroki</label>
      <input
        id="user_paroki"
        v-model="item.paroki"
        :class="['form-control', isInvalid('paroki') ? 'is-invalid' : '']"
        type="text"
        placeholder="paroki pengguna"
        @input="handleUpdateField('paroki', $event.target.value)">
      <div
        v-if="isInvalid('paroki')"
        class="invalid-feedback">{{ violations.paroki }}</div>
    </div>
    <div class="form-group">
      <label
        for="user_roles"
        class="form-control-label">roles</label>
      <input
        id="user_roles"
        v-model="item.roles"
        :class="['form-control', isInvalid('roles') ? 'is-invalid' : '']"
        type="text"
        placeholder=""
        @input="handleUpdateField('roles', $event.target.value)">
      <div
        v-if="isInvalid('roles')"
        class="invalid-feedback">{{ violations.roles }}</div>
    </div>
    <div class="form-group">
      <label
        for="user_username"
        class="form-control-label">username</label>
      <input
        id="user_username"
        v-model="item.username"
        :class="['form-control', isInvalid('username') ? 'is-invalid' : '']"
        type="text"
        placeholder=""
        @input="handleUpdateField('username', $event.target.value)">
      <div
        v-if="isInvalid('username')"
        class="invalid-feedback">{{ violations.username }}</div>
    </div>
    <div class="form-group">
      <label
        for="user_usernameCanonical"
        class="form-control-label">usernameCanonical</label>
      <input
        id="user_usernameCanonical"
        v-model="item.usernameCanonical"
        :class="['form-control', isInvalid('usernameCanonical') ? 'is-invalid' : '']"
        type="text"
        placeholder=""
        @input="handleUpdateField('usernameCanonical', $event.target.value)">
      <div
        v-if="isInvalid('usernameCanonical')"
        class="invalid-feedback">{{ violations.usernameCanonical }}</div>
    </div>
    <div class="form-group">
      <label
        for="user_salt"
        class="form-control-label">salt</label>
      <input
        id="user_salt"
        v-model="item.salt"
        :class="['form-control', isInvalid('salt') ? 'is-invalid' : '']"
        type="text"
        placeholder="The salt to use for hashing."
        @input="handleUpdateField('salt', $event.target.value)">
      <div
        v-if="isInvalid('salt')"
        class="invalid-feedback">{{ violations.salt }}</div>
    </div>
    <div class="form-group">
      <label
        for="user_email"
        class="form-control-label">email</label>
      <input
        id="user_email"
        v-model="item.email"
        :class="['form-control', isInvalid('email') ? 'is-invalid' : '']"
        type="text"
        placeholder=""
        @input="handleUpdateField('email', $event.target.value)">
      <div
        v-if="isInvalid('email')"
        class="invalid-feedback">{{ violations.email }}</div>
    </div>
    <div class="form-group">
      <label
        for="user_emailCanonical"
        class="form-control-label">emailCanonical</label>
      <input
        id="user_emailCanonical"
        v-model="item.emailCanonical"
        :class="['form-control', isInvalid('emailCanonical') ? 'is-invalid' : '']"
        type="text"
        placeholder=""
        @input="handleUpdateField('emailCanonical', $event.target.value)">
      <div
        v-if="isInvalid('emailCanonical')"
        class="invalid-feedback">{{ violations.emailCanonical }}</div>
    </div>
    <div class="form-group">
      <label
        for="user_password"
        class="form-control-label">password</label>
      <input
        id="user_password"
        v-model="item.password"
        :class="['form-control', isInvalid('password') ? 'is-invalid' : '']"
        type="text"
        placeholder="Encrypted password. Must be persisted."
        @input="handleUpdateField('password', $event.target.value)">
      <div
        v-if="isInvalid('password')"
        class="invalid-feedback">{{ violations.password }}</div>
    </div>
    <div class="form-group">
      <label
        for="user_plainPassword"
        class="form-control-label">plainPassword</label>
      <input
        id="user_plainPassword"
        v-model="item.plainPassword"
        :class="['form-control', isInvalid('plainPassword') ? 'is-invalid' : '']"
        type="text"
        placeholder="Plain password. Used for model validation. Must not be persisted."
        @input="handleUpdateField('plainPassword', $event.target.value)">
      <div
        v-if="isInvalid('plainPassword')"
        class="invalid-feedback">{{ violations.plainPassword }}</div>
    </div>
    <div class="form-group">
      <label
        for="user_lastLogin"
        class="form-control-label">lastLogin</label>
      <input
        id="user_lastLogin"
        v-model="item.lastLogin"
        :class="['form-control', isInvalid('lastLogin') ? 'is-invalid' : '']"
        type="dateTime"
        placeholder=""
        @input="handleUpdateField('lastLogin', $event.target.value)">
      <div
        v-if="isInvalid('lastLogin')"
        class="invalid-feedback">{{ violations.lastLogin }}</div>
    </div>
    <div class="form-group">
      <label
        for="user_confirmationToken"
        class="form-control-label">confirmationToken</label>
      <input
        id="user_confirmationToken"
        v-model="item.confirmationToken"
        :class="['form-control', isInvalid('confirmationToken') ? 'is-invalid' : '']"
        type="text"
        placeholder="Random string sent to the user email address in order to verify it."
        @input="handleUpdateField('confirmationToken', $event.target.value)">
      <div
        v-if="isInvalid('confirmationToken')"
        class="invalid-feedback">{{ violations.confirmationToken }}</div>
    </div>
    <div class="form-group">
      <label
        for="user_role"
        class="form-control-label">role</label>
      <input
        id="user_role"
        v-model="item.role"
        :class="['form-control', isInvalid('role') ? 'is-invalid' : '']"
        type="text"
        placeholder="{@inheritdoc}"
        @input="handleUpdateField('role', $event.target.value)">
      <div
        v-if="isInvalid('role')"
        class="invalid-feedback">{{ violations.role }}</div>
    </div>
    <div class="form-group">
      <label
        for="user_enabled"
        class="form-control-label">enabled</label>
      <input
        id="user_enabled"
        v-model="item.enabled"
        :class="['form-control', isInvalid('enabled') ? 'is-invalid' : '']"
        type="checkbox"
        placeholder=""
        @input="handleUpdateField('enabled', $event.target.value)">
      <div
        v-if="isInvalid('enabled')"
        class="invalid-feedback">{{ violations.enabled }}</div>
    </div>
    <div class="form-group">
      <label
        for="user_superAdmin"
        class="form-control-label">superAdmin</label>
      <input
        id="user_superAdmin"
        v-model="item.superAdmin"
        :class="['form-control', isInvalid('superAdmin') ? 'is-invalid' : '']"
        type="checkbox"
        placeholder="{@inheritdoc}"
        @input="handleUpdateField('superAdmin', $event.target.value)">
      <div
        v-if="isInvalid('superAdmin')"
        class="invalid-feedback">{{ violations.superAdmin }}</div>
    </div>
    <div class="form-group">
      <label
        for="user_passwordRequestedAt"
        class="form-control-label">passwordRequestedAt</label>
      <input
        id="user_passwordRequestedAt"
        v-model="item.passwordRequestedAt"
        :class="['form-control', isInvalid('passwordRequestedAt') ? 'is-invalid' : '']"
        type="dateTime"
        placeholder=""
        @input="handleUpdateField('passwordRequestedAt', $event.target.value)">
      <div
        v-if="isInvalid('passwordRequestedAt')"
        class="invalid-feedback">{{ violations.passwordRequestedAt }}</div>
    </div>
    <div class="form-group">
      <label
        for="user_groups"
        class="form-control-label">groups</label>
      <input
        id="user_groups"
        v-model="item.groups"
        :class="['form-control', isInvalid('groups') ? 'is-invalid' : '']"
        type="text"
        placeholder=""
        @input="handleUpdateField('groups', $event.target.value)">
      <div
        v-if="isInvalid('groups')"
        class="invalid-feedback">{{ violations.groups }}</div>
    </div>
    <div class="form-group">
      <label
        for="user_group"
        class="form-control-label">group</label>
      <input
        id="user_group"
        v-model="item.group"
        :class="['form-control', isInvalid('group') ? 'is-invalid' : '']"
        type="text"
        placeholder="{@inheritdoc}"
        @input="handleUpdateField('group', $event.target.value)">
      <div
        v-if="isInvalid('group')"
        class="invalid-feedback">{{ violations.group }}</div>
    </div>

    <button
      type="submit"
      class="btn btn-success">Submit</button>
  </form>
</template>

<script>
export default {
  props: {
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
    }
  }
}
</script>
