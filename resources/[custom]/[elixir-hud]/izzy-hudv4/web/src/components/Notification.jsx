import { useData } from 'contexts/DataContext';
import { useNuiEvent } from 'hooks/useNuiEvent';
import React, { useEffect } from 'react';
import toast, { Toaster } from 'react-hot-toast';
import { hexToRGB } from 'utils/misc';
import { motion as m } from 'framer-motion';
import { useLang } from 'contexts/LangContext';

export default function Notification() {
	const { notifyPosition, colors } = useData();
	const { lang } = useLang();
	const notify = (data) => {
		const color = colors[data.color] ?? colors['pink'];
		toast.custom(
			(t) => (
				<m.div
					initial={{
						opacity: 0,
						x: notifyPosition == 'top-left' || notifyPosition == 'bottom-left' ? '-150%' : notifyPosition == 'top-right' || notifyPosition == 'bottom-right' ? '150%' : 0,
						y: notifyPosition == 'top-center' ? '-150%' : notifyPosition == 'bottom-center' ? '150%' : 0,
					}}
					animate={{
						opacity: t.visible ? 1 : 0,
						x:
							notifyPosition == 'top-left' || notifyPosition == 'bottom-left'
								? t.visible
									? 0
									: '-150%'
								: notifyPosition == 'top-right' || notifyPosition == 'bottom-right'
								? t.visible
									? 0
									: '150%'
								: 0,
						y: notifyPosition == 'top-center' ? (t.visible ? 0 : '-150%') : notifyPosition == 'bottom-center' ? (t.visible ? 0 : '150%') : 0,
					}}
					transition={{ type: 'tween' }}
					className='flex items-center gap-x-[2.0625rem] relative -left-4 my-3'
				>
					<Icon color={color} />
					<div
						style={{
							background: `radial-gradient(46.8% 160.82% at 0% 49.28%, rgba(${hexToRGB(color.primary)}, 0.37) 0%, rgba(${hexToRGB(
								color.secondary
							)}, 0) 100%), linear-gradient(90deg, #000000 12.81%, rgba(0, 0, 0, 0) 100%)`,
						}}
						className='relative left-20 rounded-sm'
					>
						<div className='absolute left-0 w-full h-full border border-white/[.06] rounded' />
						<div className='py-3 pl-8 pr-3'>
							<p className='font-gr-sb text-white leading-3 mb-1'>{lang.information}</p>
							<p className='text-xs font-gr-r text-white/[.65] leading-3 w-[17.1875rem]'>{data.str}</p>
						</div>
					</div>
				</m.div>
			),
			{
				duration: data.duration,
			}
		);
	};

	useNuiEvent('addNotification', (data) => notify(data));
	return <Toaster position={notifyPosition ?? 'top-center'} />;
}

const Icon = ({ color }) => {
	return (
		<svg className='absolute z-10' width='122' height='131' viewBox='0 0 122 131' fill='none' xmlns='http://www.w3.org/2000/svg'>
			<g filter={`url(#filter0_d_115_38${color.primary})`}>
				<path
					d='M59.654 28.8563C60.487 28.3754 61.5133 28.3754 62.3463 28.8563L91.9617 45.9548C92.7947 46.4357 93.3079 47.3245 93.3079 48.2864V82.4834C93.3079 83.4452 92.7947 84.334 91.9617 84.815L62.3463 101.913C61.5133 102.394 60.487 102.394 59.654 101.913L30.0385 84.815C29.2055 84.334 28.6924 83.4452 28.6924 82.4834V48.2864C28.6924 47.3245 29.2055 46.4357 30.0385 45.9548L59.654 28.8563Z'
					fill='black'
					fill-opacity='0.9'
					shape-rendering='crispEdges'
				/>
				<path
					d='M59.654 28.8563C60.487 28.3754 61.5133 28.3754 62.3463 28.8563L91.9617 45.9548C92.7947 46.4357 93.3079 47.3245 93.3079 48.2864V82.4834C93.3079 83.4452 92.7947 84.334 91.9617 84.815L62.3463 101.913C61.5133 102.394 60.487 102.394 59.654 101.913L30.0385 84.815C29.2055 84.334 28.6924 83.4452 28.6924 82.4834V48.2864C28.6924 47.3245 29.2055 46.4357 30.0385 45.9548L59.654 28.8563Z'
					fill={`url(#paint0_linear_115_38${color.primary})`}
					shape-rendering='crispEdges'
				/>
			</g>
			<g filter={`url(#filter1_i_115_38${color.primary})`}>
				<path
					d='M47.2782 75.4813C46.4307 75.4813 45.9015 74.5634 46.3261 73.83L60.0484 50.1278C60.4721 49.396 61.5288 49.396 61.9525 50.1278L75.6748 73.83C76.0994 74.5634 75.5702 75.4813 74.7228 75.4813H47.2782ZM61.0005 71.2184C61.4031 71.2184 61.7408 71.082 62.0136 70.8092C62.2864 70.5364 62.4223 70.1992 62.4214 69.7975C62.4205 69.3959 62.284 69.0586 62.0122 68.7858C61.7403 68.513 61.4031 68.3766 61.0005 68.3766C60.5979 68.3766 60.2606 68.513 59.9888 68.7858C59.7169 69.0586 59.5805 69.3959 59.5795 69.7975C59.5786 70.1992 59.715 70.5369 59.9888 70.8106C60.2625 71.0844 60.5998 71.2203 61.0005 71.2184ZM59.5795 65.8555C59.5795 66.4631 60.072 66.9556 60.6796 66.9556H61.3213C61.9289 66.9556 62.4214 66.4631 62.4214 65.8555V60.951C62.4214 60.3434 61.9289 59.8509 61.3213 59.8509H60.6796C60.072 59.8509 59.5795 60.3434 59.5795 60.951V65.8555Z'
					fill={`url(#paint1_linear_115_38${color.primary})`}
				/>
			</g>
			<path
				d='M58.9819 26.6823C60.2308 25.9618 61.7692 25.9618 63.0181 26.6823L93.5309 44.2859C94.7811 45.0071 95.5513 46.3407 95.5513 47.7839V82.9853C95.5513 84.4286 94.7811 85.7621 93.5309 86.4833L63.0181 104.087C61.7692 104.807 60.2308 104.807 58.9819 104.087L28.4691 86.4833C27.2189 85.7621 26.4487 84.4286 26.4487 82.9853V47.7839C26.4487 46.3407 27.2189 45.0071 28.4691 44.2859L58.9819 26.6823Z'
				stroke={color.primary}
				stroke-width='0.897436'
			/>
			<defs>
				<filter id={`filter0_d_115_38${color.primary}`} x='0.692383' y='0.495117' width='120.615' height='129.779' filterUnits='userSpaceOnUse' color-interpolation-filters='sRGB'>
					<feFlood flood-opacity='0' result='BackgroundImageFix' />
					<feColorMatrix in='SourceAlpha' type='matrix' values='0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 127 0' result='hardAlpha' />
					<feOffset />
					<feGaussianBlur stdDeviation='14' />
					<feComposite in2='hardAlpha' operator='out' />
					<feColorMatrix type='matrix' values='0 0 0 0 1 0 0 0 0 0.290196 0 0 0 0 0.290196 0 0 0 0.31 0' />
					<feBlend mode='normal' in2='BackgroundImageFix' result='effect1_dropShadow_115_389' />
					<feBlend mode='normal' in='SourceGraphic' in2='effect1_dropShadow_115_389' result='shape' />
				</filter>
				<filter id={`filter1_i_115_38${color.primary}`} x='44.1276' y='49.5791' width='31.6966' height='27.9515' filterUnits='userSpaceOnUse' color-interpolation-filters='sRGB'>
					<feFlood flood-opacity='0' result='BackgroundImageFix' />
					<feBlend mode='normal' in='SourceGraphic' in2='BackgroundImageFix' result='shape' />
					<feColorMatrix in='SourceAlpha' type='matrix' values='0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 127 0' result='hardAlpha' />
					<feOffset dx='-2.04917' dy='2.04917' />
					<feGaussianBlur stdDeviation='1.89549' />
					<feComposite in2='hardAlpha' operator='arithmetic' k2='-1' k3='1' />
					<feColorMatrix type='matrix' values='0 0 0 0 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0.23 0' />
					<feBlend mode='normal' in2='shape' result='effect1_innerShadow_115_389' />
				</filter>
				<radialGradient id={`paint0_linear_115_38${color.primary}`} cx='0' cy='0' r='1' gradientUnits='userSpaceOnUse' gradientTransform='translate(28.6924 64.8442) scale(75.8333 112.52)'>
					<stop stop-color={color.primary} stop-opacity='0.37' />
					<stop offset='1' stop-color={color.secondary} stop-opacity='0' />
				</radialGradient>
				<linearGradient id={`paint1_linear_115_38${color.primary}`} x1='61.0005' y1='48.4834' x2='61.0005' y2='75.4813' gradientUnits='userSpaceOnUse'>
					<stop stop-color={color.primary} />
					<stop offset='1' stop-color={color.secondary} />
				</linearGradient>
			</defs>
		</svg>
	);
};
