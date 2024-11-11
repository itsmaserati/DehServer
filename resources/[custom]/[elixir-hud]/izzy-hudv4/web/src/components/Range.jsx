import React from 'react';

export default function Range({ value = 0, onChange }) {
	return (
		<div className='w-40 h-[.5rem] relative flex items-center'>
			<span className='absolute left-0 h-full bg-white/[0.57] rounded-full' style={{ width: (value / 200) * 100 + '%' }} />
			<input step={1} max={200} value={value} onChange={onChange} type='range' className='w-full h-full' />
		</div>
	);
}
