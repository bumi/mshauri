import { shallowMount } from '@vue/test-utils'
import Loader from '@/component/Loader'

describe('Loader', () => {
  it('renders invisible when the value is false', () => {
    const wrapper = shallowMount(Loader, {
      propsData: { value: false }
    });
    expect(wrapper.vm.visible).toEqual(false)
  });

  it('renders delayed visible when the value is true', async() => {
    const wrapper = shallowMount(Loader, {
      propsData: { value: true }
    });
    expect(wrapper.vm.visible).toEqual(false);
    await new Promise((r) => setTimeout(r, 500));
    expect(wrapper.vm.visible).toEqual(true);
  });
})
