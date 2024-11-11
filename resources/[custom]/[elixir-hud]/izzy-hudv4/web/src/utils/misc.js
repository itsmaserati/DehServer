export const isEnvBrowser = () => !window.invokeNative;

// Basic no operation function
export const noop = () => {};

export function hexToRGB(hex) {
	if (!hex) return;
	var r = parseInt(hex.slice(1, 3), 16),
		g = parseInt(hex.slice(3, 5), 16),
		b = parseInt(hex.slice(5, 7), 16);

	return r + ', ' + g + ', ' + b;
}

export const formatter = new Intl.NumberFormat('en-US', {
	style: 'currency',
	currency: 'USD',
	maximumFractionDigits: 0,
});

export const convertValue = (value, oldMin, oldMax, newMin, newMax) => {
	const oldRange = oldMax - oldMin;
	const newRange = newMax - newMin;
	const newValue = ((value - oldMin) * newRange) / oldRange + newMin;
	return newValue;
};
