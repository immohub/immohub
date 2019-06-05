import resolve from 'rollup-plugin-node-resolve';
import commonjs from 'rollup-plugin-commonjs';
import pkg from './package.json';
import babel from 'rollup-plugin-babel';

const external = ['react']
const globals = {
  react: 'React',
}

export default [
	// browser-friendly UMD build
	{
		input: 'src/main.js',
		external,
		output: {
			name: 'shared',
			file: pkg.browser,
			format: 'umd',
			globals
		},
		plugins: [
			babel({
				exclude: ['node_modules/**'],
				presets: [
		      [
		        '@babel/preset-env',
		        {
		          targets: {
		            ie: 9
		          },
		          useBuiltIns: false,
		          modules: false
		        }
		      ],
		      '@babel/preset-react'
		    ],
			}),
			resolve(), // so Rollup can find `ms`
			commonjs(), // so Rollup can convert `ms` to an ES module
		]
	},

	{
		input: 'src/main.js',
		external,
		output: [
			{ file: pkg.main, format: 'cjs', globals },
			{ file: pkg.module, format: 'es', globals }
		],
		plugins: [
			babel({
				exclude: ['node_modules/**'],
				presets: [
		      [
		        '@babel/preset-env',
		        {
		          targets: {
		            ie: 9
		          },
		          useBuiltIns: false,
		          modules: false
		        }
		      ],
		      '@babel/preset-react'
		    ],
			})
		]
	},
];
