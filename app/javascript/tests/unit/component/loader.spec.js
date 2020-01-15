import { shallowMount } from '@vue/test-utils'
import Loader from '@/component/Loader'
import Vue from 'vue'

describe('Loader', () => {
  it('renders invisible when the value is false', () => {
    const wrapper = shallowMount(Loader, {
      propsData: { value: false }
    });
    expect(wrapper.vm.visible).toEqual(false)
  });

  it('delays visibility when the props.value is true', async() => {
    const wrapper = shallowMount(Loader, {
      propsData: { value: true }
    });
    expect(wrapper.vm.visible).toEqual(false);
    await new Promise((r) => setTimeout(r, 500));
    expect(wrapper.vm.visible).toEqual(true);
  });

  it('becomes invisible when the props.value is set to false', async() => {
    const wrapper = shallowMount(Loader, {
      propsData: { value: true }
    });
    await new Promise((r) => setTimeout(r, 500));
    wrapper.setProps({ value: false })
    await Vue.nextTick()
    expect(wrapper.vm.visible).toEqual(false);
  });
})
