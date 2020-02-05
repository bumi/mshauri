import { shallowMount } from '@vue/test-utils'
import ProgressBar from '@/component/ProgressBar'

describe('ProgressBar', () => {
  it('renders with the specified value', () => {
    const progress = 70;
    const wrapper = shallowMount(ProgressBar, {
      propsData: { value: progress }
    });
    expect(wrapper.vm.progress).toEqual(progress + '%');
  });

  it('value can be updated', () => {
    const wrapper = shallowMount(ProgressBar, {
      propsData: { value: 40 }
    });
    wrapper.setProps({ value: 55 })
    expect(wrapper.vm.progress).toEqual('55%');
  });
});